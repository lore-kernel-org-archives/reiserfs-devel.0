From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Thu, 14 Oct 2004 22:42:31 +0400
Message-ID: <200410142242.31184.vitaly@namesys.com>
References: <40FC740900079C5C@mail13.jumpyint.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC740900079C5C@mail13.jumpyint.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: frbiscani@jumpy.it, reiserfs-list@namesys.com

On Thursday 14 October 2004 21:08, frbiscani@jumpy.it wrote:
> After a reiser4 crash I had to run fsck with the --build-fs option. Some
>
> garbage was collected in /lost+found. I deleted it for the most part, but
>
> there are "files" I can't remove.
>
> For example:
>
> rm /lost+found/lost_name_*
>
> gives:
>
> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2e2r?\t
>
> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
> file
> or directory
> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2f3r?\t
>
> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
> file
> or directory
> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e306r?\t
>
> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
> file
> or directory
> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e310r?\t
>
> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
> file
> or directory
> [...]
>
> and so on. I've tried also "rm -d" and unlink, but with no luck. Is there
> a
> way to clean up (apart from mkfs :))?

would you pack the metadata with:
	debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2
and provide it to me for downloading?

-- 
Thanks,
Vitaly Fertman

