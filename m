From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Fri, 15 Oct 2004 10:07:56 +0200
Message-ID: <416F855C.8040204@dermichi.com>
References: <40FC740900079C5C@mail13.jumpyint.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC740900079C5C@mail13.jumpyint.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: frbiscani@jumpy.it, ReiserFS List <reiserfs-list@namesys.com>

> rm /lost+found/lost_name_*
> 
> gives:
> 
> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2e2r?\t
> 
> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
> file 
> or directory
had the same problem, it is related to fsck which computes hashes the 
wrong way if filenames are too long (and/or contain non-ascii 
characters). vladimir sent a patch to the mailing list that corrected 
this bug for me. not sure if this is already available in the 
pre-version of reiser4progs.

regards,
michael
