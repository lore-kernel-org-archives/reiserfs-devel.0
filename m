From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13037] reiserfs panic (device null superblock)
Date: Thu, 2 Jul 2009 17:34:00 GMT
Message-ID: <200907021734.n62HY09R007375@demeter.kernel.org>
References: <bug-13037-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13037-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13037





--- Comment #5 from Pawel Zawora <pzawora@gmail.com>  2009-07-02 17:33:59 ---
bugzilla-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=13037
>
>
>
>
>
> --- Comment #4 from Jeff Mahoney <jeffm@suse.com>  2009-07-02 15:00:56 ---
> So the problem exists on 2.6.28.9 and not on 2.6.28?
/look at
Description from  Pawel Zawora 2009-04-07 11:38:17/

[...]

On 2.6.25.4 works stable. 
Upgrade to 2.6.28.7 and 2.6.28.9 causes kernel panic[...]



> That's strange since the
> only reiserfs change is this one:
>
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -2556,7 +2556,7 @@ static int reiserfs_write_begin(struct file *file,
>         }
>
>         index = pos >> PAGE_CACHE_SHIFT;
> -       page = __grab_cache_page(mapping, index);
> +       page = grab_cache_page_write_begin(mapping, index, flags);
>         if (!page)
>                 return -ENOMEM;
>         *pagep = page;
>
> I'm surprised that reiserfsck doesn't come up with anything. This is a problem
> where it's seeing an invalid bit on disk. Either that or memory corruption.
>
>   
/look at
Description from  Pawel Zawora 2009-04-07 11:38:17/

[...]

We tested:
1. Completely different hardware [...]

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
