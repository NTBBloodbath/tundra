# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_diesel_global_optspecs
	string join \n database-url= config-file= locked-schema h/help V/version
end

function __fish_diesel_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_diesel_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_diesel_using_subcommand
	set -l cmd (__fish_diesel_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c diesel -n "__fish_diesel_needs_command" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_needs_command" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_needs_command" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_needs_command" -s V -l version -d 'Print version'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "migration" -d 'A group of commands for generating, running, and reverting migrations.'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "setup" -d 'Creates the migrations directory, creates the database specified in your DATABASE_URL, and runs existing migrations.'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "database" -d 'A group of commands for setting up and resetting your database.'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "completions" -d 'Generate shell completion scripts for the diesel command.'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "print-schema" -d 'Print table definitions for database schema.'
complete -c diesel -n "__fish_diesel_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "run" -d 'Runs all pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "revert" -d 'Reverts the specified migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "redo" -d 'Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "list" -d 'Lists all available migrations, marking those that have been applied.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "pending" -d 'Returns true if there are any pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "generate" -d 'Generate a new migration with the given name, and the current timestamp as the version.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and not __fish_seen_subcommand_from run revert redo list pending generate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from run" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from run" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from run" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from run" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -s n -l number -d 'Reverts the last `n` migration files.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -s a -l all -d 'Reverts previously run migration files.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from revert" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -s n -l number -d 'Redo the last `n` migration files.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -s a -l all -d 'Reverts and re-runs all migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from redo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from list" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from list" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from list" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from list" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from pending" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from pending" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from pending" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from pending" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from pending" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l version -d 'The version number to use when generating the migration. Defaults to the current timestamp, which should suffice for most use cases.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l format -d 'The format of the migration to be generated.' -r -f -a "{sql\t''}"
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l diff-schema -d 'Populate the generated migrations based on the current difference between your `schema.rs` file and the specified database.   The generated migrations are not expected to be perfect. Be sure to check whether they meet your expectations. Adjust the generated output if that\'s not the case.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l schema-key -d 'select schema key from diesel.toml, use \'default\' for print_schema without key.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -s u -l no-down -d 'Don\'t generate a down.sql file. You won\'t be able to run migration `revert` or `redo`.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l sqlite-integer-primary-key-is-bigint -d 'For SQLite 3.37 and above, detect `INTEGER PRIMARY KEY` columns as `BigInt`, when the table isn\'t declared with `WITHOUT ROWID`. See https://www.sqlite.org/lang_createtable.html#rowid for more information. Only used with the `--diff-schema` argument.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -s o -l only-tables -d 'Only include tables from table-name that matches regexp.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -s e -l except-tables -d 'Exclude tables from table-name that matches regex.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from generate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "run" -d 'Runs all pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "revert" -d 'Reverts the specified migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "redo" -d 'Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all available migrations, marking those that have been applied.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "pending" -d 'Returns true if there are any pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "generate" -d 'Generate a new migration with the given name, and the current timestamp as the version.'
complete -c diesel -n "__fish_diesel_using_subcommand migration; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand setup" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand setup" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand setup" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand setup" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand setup" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL, and then runs any existing migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -f -a "reset" -d 'Resets your database by dropping the database specified in your DATABASE_URL and then running `diesel database setup`.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and not __fish_seen_subcommand_from setup reset drop help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from setup" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from setup" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from setup" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from setup" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from setup" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from reset" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from reset" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from reset" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from reset" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from drop" -l migration-dir -d 'The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from drop" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from drop" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from drop" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from drop" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL, and then runs any existing migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "reset" -d 'Resets your database by dropping the database specified in your DATABASE_URL and then running `diesel database setup`.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL.'
complete -c diesel -n "__fish_diesel_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand completions" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand completions" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand completions" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -s s -l schema -d 'The name of the schema.' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l with-docs-config -d 'Render documentation comments for tables and columns.' -r -f -a "{database-comments-fallback-to-auto-generated-doc-comment\t'',only-database-comments\t'',no-doc-comments\t''}"
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l column-sorting -d 'Sort order for table columns.' -r -f -a "{ordinal_position\t'',name\t''}"
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l patch-file -d 'A unified diff file to be applied to the final schema.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l import-types -d 'A list of types to import for every table, separated by commas.' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l except-custom-type-definitions -d 'A list of regexes to filter the custom types definitions generated' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l custom-type-derives -d 'A list of derives to implement for every automatically generated SqlType in the schema, separated by commas.' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l schema-key -d 'select schema key from diesel.toml, use \'default\' for print_schema without key.' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l database-url -d 'Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.' -r
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l config-file -d 'The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.' -r -F
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -s o -l only-tables -d 'Only include tables from table-name that matches regexp.'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -s e -l except-tables -d 'Exclude tables from table-name that matches regex.'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l with-docs -d 'Render documentation comments for tables and columns.'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l no-generate-missing-sql-type-definitions -d 'Generate SQL type definitions for types not provided by diesel'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l sqlite-integer-primary-key-is-bigint -d 'For SQLite 3.37 and above, detect `INTEGER PRIMARY KEY` columns as `BigInt`, when the table isn\'t declared with `WITHOUT ROWID`. See https://www.sqlite.org/lang_createtable.html#rowid for more information.'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -l locked-schema -d 'Require that the schema file is up to date.'
complete -c diesel -n "__fish_diesel_using_subcommand print-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "migration" -d 'A group of commands for generating, running, and reverting migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "setup" -d 'Creates the migrations directory, creates the database specified in your DATABASE_URL, and runs existing migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "database" -d 'A group of commands for setting up and resetting your database.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "completions" -d 'Generate shell completion scripts for the diesel command.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "print-schema" -d 'Print table definitions for database schema.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and not __fish_seen_subcommand_from migration setup database completions print-schema help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "run" -d 'Runs all pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "revert" -d 'Reverts the specified migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "redo" -d 'Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "list" -d 'Lists all available migrations, marking those that have been applied.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "pending" -d 'Returns true if there are any pending migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from migration" -f -a "generate" -d 'Generate a new migration with the given name, and the current timestamp as the version.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL, and then runs any existing migrations.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "reset" -d 'Resets your database by dropping the database specified in your DATABASE_URL and then running `diesel database setup`.'
complete -c diesel -n "__fish_diesel_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL.'
