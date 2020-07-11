module main

import emily33901.vproto.compiler

// This file does a lot of what vproto.v does
// but this time its just automated for a reason

import os
import v.table
import v.parser
import v.pref
import v.fmt
import v.ast

fn format_file(path string) {
	table := table.new_table()
	ast_file := parser.parse_file(path, table, .parse_comments, &pref.Preferences{ is_fmt: true }, &ast.Scope{
		parent: 0
	})

	result := fmt.fmt(ast_file, table, false)

	os.write_file(path, result)
}

fn main() {
	println('Generating protobufs...')

	exe_file := find_abs_path_of_executable(os.executable())?
	exe_path := exe_file.all_before_last(os.path_separator)
	println('exe path is $exe_path')

	protobufs_location := os.real_path('$exe_path/../resources/protobufs/steam/')
	out_folder := os.real_path('$exe_path/../proto/')

	mut paths := os.ls(protobufs_location)?
	// mut paths := []string{}
	paths << os.real_path('$protobufs_location/../google/protobuf/descriptor.proto')
	
	imports := ['$protobufs_location', os.real_path('$protobufs_location/..')]
	println('imports are $protobufs_location')

	for file_name in paths {
		// check for the google descriptor protobuf
		// which is the only absolute name here
		path := if file_name.contains(os.path_separator) {
			file_name
		} else {
			'$protobufs_location/$file_name'
		}

		println('$path')

		if os.is_dir(path) { continue }

		if !os.is_dir(out_folder) {
			println('creating folder $out_folder ...')
			os.mkdir(out_folder)
		}

		// TODO do we really need to validate here aswell?
		// seems slightly unnecessary since we know that the 
		// steam protos are well formed
		mut p := compiler.new_parser(false, imports)
		mut f := p.parse_file(path, 'proto')
		p.validate()

		mut g := compiler.new_gen(p)
		filename := os.real_path(f.filename).all_after_last(os.path_separator).all_before_last('.') + '_pb.v'
		out_path := os.join_path(os.real_path(out_folder), filename)
		os.write_file(out_path, g.gen_file_text(f))
		format_file(out_path)
	}
}