From: Perry Kundert <perry@kundert.ca>
Subject: Reiser4 changes meaning of ENOENT/EACCES, breaking gcc?
Date: Thu, 29 Jul 2004 17:54:52 -0600
Message-ID: <41098E4C.9070007@kundert.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello;

    I am running 2.6.5 patched wtih Debian package 
"kernel-patch-2.6-reiser4", varsion 20040326-2.  So far, my uptime is 65 
days, running a quite active Apache/NFS/WiFi/Shorewall server.  Some 
known problems with corruption of Mozilla's configuration and mail files 
when it accesses them over NFS (and corruption of files written by the 
"tee" program, oddly enough), but everything else seems to work fine.  
Until now...

    I am attempting to build openzaurus.  Along the way it builds glibc, 
which fails due to the following problem (see below).

    Question:  has reiser4 changed the semantics of accessing 
directories and files in such a way that we should expect similar 
failures in other programs that use error codes to distinguish between 
files and directories?  Is this a known/expected issue that is not 
expected to cause too many problems?

    By the way, his suggested workaround was effective...

--
    -pjk



>Situation: reiser4 filesystem, wd contains an ordinary file mode 0644 named
>'nss'. (This is important).
>
>Cause: in gcc/cppfiles.c,
>_cpp_find_file() calls find_file_in_dir() on . for nss/nsswitch.h
>find_file_in_dir() calls open_file() on ./nss/nsswitch.h
>open_file() calls open() on ./nss/nsswitch.h
>Instead of failing ENOTDIR, open() fails EACCES. This is because under reiser4
>all files are directories so ENOTDIR is unused as an error code; instead it
>tries to read 'nss' as a directory but as 'nss' is 0644 its "directory contents"
>are not accessible.
>On any normal file system, open() fails ENOTDIR, open_file() returns false
>converting ENOTDIR to ENOENT, find_file_in_dir() returns false, and
>_cpp_find_file() continues to the next node in the include list, eventually
>finding nss/nsswitch.h in -I..
>On reiser4, open() fails EACCES, open_file() returns false, find_file_in_dir()
>calls open_file_failed() and returns true, everything falls apart.
>
>The workaround I suggest for glibc is to make 'nss' 0755 thus causing open() to
>fail ENOENT which causes _cpp_find_file_in_dir() to continue to the next node in
>the include list.
>
>The fix I suggest for gcc is to make EACCES non-fatal: gcc should instead of
>failing print a warning message and continue searching for an include file it
>can access. 
>
>The patch is obvious and I will attach it as soon as I have tested it properly.
>
>-- 
>           Summary: "Permission denied" compiling glibc 2.3.3 on reiser4:
>                    EACCES fatal to #include
>           Product: gcc
>           Version: 3.4.0
>            Status: UNCONFIRMED
>          Severity: normal
>          Priority: P2
>         Component: c
>        AssignedTo: unassigned at gcc dot gnu dot org
>        ReportedBy: ed at catmur dot co dot uk
>                CC: gcc-bugs at gcc dot gnu dot org
>
>
>http://gcc.gnu.org/bugzilla/show_bug.cgi?id=15772
>
