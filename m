From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 20:22:12 +0400
Message-ID: <16529.11188.555986.964130@laputa.namesys.com>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>
	<16528.46352.173184.528623@laputa.namesys.com>
	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu>
	<16529.9818.916980.360020@laputa.namesys.com>
	<200404291614.i3TGEoAI017900@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18288-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404291614.i3TGEoAI017900@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu writes:
 > On Thu, 29 Apr 2004 19:59:22 +0400, Nikita Danilov said:
 > 
 > > chmod u+rx backup/fsplit.c
 > > 
 > > "x" bit is necessary for lookups, and "r" bit---for readdir.
 > 
 > This is going to be *such* a non-starter - there's many decades of
 > "C files are mode 644 and executables are 755" tradition that this
 > will fly against.  What this basically implies is that the 'execute'

Eh? What I described is precisely decades old meaning of rwx bits for
directories.

Problem is that we have to fit objects that are both regular files and
directories into access control scheme that wasn't designed for such a
mix. I don't see better solution short of inventing new bit(s).

 > bit is useless, because it's being overloaded to mean both "the file
 > is executable" and "you can peek at the metadata".
 > 
 > % cd /tmp
 > % cat > foo.sh
 > echo foo
 > % ./foo.sh
 > -bash: ./foo.sh: Permission denied
 > % chmod +x ./foo.sh
 > % ./foo.sh
 > foo
 > 
 > Do you really intend to break those semantics??

Nikita.
