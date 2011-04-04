From: =?iso-8859-1?q?berny=AE?= <berny@dwami.com>
Subject: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Mon, 4 Apr 2011 11:42:42 +0100
Message-ID: <201104041142.42496.berny@dwami.com>
References: <201103090918.47762.berny@dwami.com> <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D7FA356.1000309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Dear Edward, I tried the new patch for the 2.6.38 but the bug is still there so no file copy using 
kde file managers, files are still empty till unmount.

Thanks, Paolo

> >> I suspect that it's similar to what I experienced with gnome upgrade
> >> back in time. My problem was due to issues in splice code path which
> >> GNOME switch to for file copying along the way. I already reported
> >> this to GNOME [1] as well as this ML [2,3]. The issue appearing in
> >> only uncompressed partitions is interesting, Edward already asked me
> 
> It seems this is because of the following not implemented "todo":
> 
> int write_begin_unix_file(struct file *file, struct page *page,
> 			  loff_t pos, unsigned len, void **fsdata)
> {
> 
> ...
> 	if (info->container == UF_CONTAINER_TAILS) {
> 		warning("edward-1563", "Option not implemented");
> 		drop_exclusive_access(info);
> 		return -EINVAL;
> 	}
> 
> Tail conversion should go in this branch.
> I'll try to implement it for .38, and we'll see,
> if this was really the issue.
> 
> Thanks,
> Edward.
> 
> >> if mine was, which isn't. My current workaround is to use a patched
> >> version of glib (part of gnome libs) that avoids using splice for
> >> reiser4 targets. If you have a KDE bugzilla account, can you also
> >> provide them links for discussions in the list as well as the GNOME
> >> bug?
> >> 
> >> 1: https://bugzilla.gnome.org/show_bug.cgi?id=615346
> >> 2: http://marc.info/?l=reiserfs-devel&m=127096098705179&w=2
> >> 3: http://marc.info/?l=reiserfs-devel&m=129275181431455&w=2
> >> --
> > 
> > So it seems that also kde probably use this library to splice data from
> > a pipe, I saw that it seemed resolved in 2.6.36 but it is here again in
> > 2.6.37.
> > I read your links, very good information.
> > I never know that kde was using this splice for copying things.
> > Sorry but I'm not member of kde bugzilla, I was simply searching for
> > information.
> > The problem is that only reiser4 exhibit this problem on my system so I
> > guessed that was a problem of this file system, this is the reason
> > because I didn't fill a bug on the other bugzilla.
> > 
> > Thanks,
> > Paolo
> > 
> >> To unsubscribe from this list: send the line "unsubscribe
> >> reiserfs-devel" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at http://vger.kernel.org/majordomo-info.html
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > reiserfs-devel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at http://vger.kernel.org/majordomo-info.html
