#!/usr/bin/env bash
#set -Ceu
#---------------------------------------------------------------------------
# SQLite3の正規表現APIであるregexp()のユーザ関数をビルドする。
# CreatedAt: 2020-09-30
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	readonly OUT_DIR="$HOME/root/sys/env/tool/sqlite_ext"
	readonly LIB_NAME='pcre.so'
	readonly OUT_PATH="$OUT_DIR/$LIB_NAME"
	Build() {
		[ -f "$OUT_PATH" ] && return;
		sudo apt -y install libsqlite3-dev
		git clone https://github.com/ralight/sqlite3-pcre
		cd sqlite3-pcre
		make
		cp "$LIB_NAME" "$OUT_DIR"
	}
	Setup() {
#		readonly SETUP_CODE=".load $HOME/root/sys/env/tool/sqlite_ext/pcre.so"
		readonly SETUP_CODE=".load $OUT_PATH"
		readonly PATH_RC="$HOME/.sqliterc"
		[ ! -f "$PATH_RC" ] && NUM=0 || NUM=$(grep -c "$SETUP_CODE" "$PATH_RC")
		[ 0 -eq $NUM ] && echo "$SETUP_CODE" >> "$PATH_RC"
	}
	Build; Setup;
}
Run "$@"
