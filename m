From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 19:59:22 +0400
Message-ID: <16529.9818.916980.360020@laputa.namesys.com>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>
	<16528.46352.173184.528623@laputa.namesys.com>
	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Boyd Waters writes:
 > 
 > On Apr 29, 2004, at 1:56 AM, Nikita Danilov wrote:
 > 
 > > Boyd Waters writes:
 > >> Perhaps this is obvious, but why am I getting "Permission Denied"
 > >> errors on the "metas" pseudo for some -- but not all -- of the files 
 > >> on
 > >> a reiser4 volume?
 > >>
 > >> (doing this as root)
 > >
 > > Can you provide more details?
 > 
 > Sorry, I know I was not very specific, but I thought perhaps there was 
 > a quick obvious answer.
 > 
 > Here is a simple case: a directory that holds three files; I can see 
 > the metas dir on one of the files and not on another one.
 > 
 > It's like this all over this file system. I cannot predict which files 
 > will let me look at their "metas" pseudo. All directories seem to 
 > support the metas pseudo consistently.
 > 
 > 
 > 
 > > lurch __ # ls backup/
 > > backup.sh*  fsplit*  fsplit.c
 > 
 > > lurch __ # ls backup/fsplit.c/metas
 > > ls: backup/fsplit.c/metas: Permission denied

chmod u+rx backup/fsplit.c

"x" bit is necessary for lookups, and "r" bit---for readdir.

Nikita.

