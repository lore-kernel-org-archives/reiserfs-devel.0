From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Snapshots a la NetApp?
Date: 26 Mar 2003 22:11:24 +0100
Message-ID: <1048713082.1316.41.camel@wusel.schnulli.de>
References: <200303221822.34401.phma@webjockey.net>
	 <33433.10.20.2.148.1048390681.squirrel@alpha>
	 <1048411014.1427.5.camel@wusel.schnulli.de> <3E7F6F66.5050808@namesys.com>
	 <1048542143.1332.31.camel@wusel.schnulli.de>  <20030325000302.GB6118@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030325000302.GB6118@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Am Die, 2003-03-25 um 01.03 schrieb Tom Vier:
> fwiw, there's pdumpfs, which does much the same thing. it's much like
> plan9's dump (which writes snapshots to worm media). pdumpfs has worked
> great for me. i just use it for my home directory. note that many programs
> don't handle hardlinks well. specifically tar, cpio, and rsync (the last two
> use TONS of memory even if you have just a few months worth of snapshots).

Thanks for the hint - I've never heard before about pdumpfs. I wrote storeBackup
because I could not find such a tool.

A very basic idea of both progs are the same: to use hard links. But the
implementation differs.

The difference is, that pdumpfs depends on paths and file names.
StoreBackup depends on the *contents* of the files, compresses optional
and can share files via hard links between independent backups of different
trees (computers).

The parameters are:
        storeBackup.pl -f configFile [-g | --print]
or
        storeBackup.pl -s sourceDir -t targetDir [-T tmpdir] [-L lockFile]
                [--exceptDirs dir1,dir2,dir3] [--exceptDirsSep sep]
                [--precommand job] [--followLinks depth]
                [-c compress] [-u uncompress] [-p postfix]
                [--noCompress number] [--queueCompress number]
                [--noCopy number] [--queueCopy number]
                [--withUserGroupStat] [--userGroupStatFile filename]
                [--exceptSuffix suffixes]
                [--addExceptSuffix suffixes] [--contExceptDirsErr]
                [--compressMD5File yes|no] [--chmodMD5File] [-v] [-d level]
                [--keepAll timescale] [--keepWeekday entry]
                [--keepMinNumber number] [--keepOnlyLastOfDay timescale]
                [--nodelete] [--progressReport number] [--printDepth]
                [--ignoreReadError]
                [-l logFile
                 [--plusLogStdout] [--withTime yes|no] [-m maxFilelen]
                 [[-n noOfOldFiles] | [--saveLogs yes|no]
                 [--compressWith compressprog]]
                [--logInBackupDir yes|no [--compressLogInBackupDir yes|no]
                 [--logInBackupDirFileName logFile]]
                [otherBackupDirs ...]

best regards,

-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk

