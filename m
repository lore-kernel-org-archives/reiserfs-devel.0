From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: 14 Jan 2003 17:39:44 -0500
Message-ID: <b023jg$519$1@satsuki.furryterror.org>
References: <b01n0f$qq$1@genki.hungrycats.org> <15908.17236.966170.982897@laputa.namesys.com> <b01n0f$qq$1@genki.hungrycats.org> <15908.25054.542735.558616@laputa.namesys.com>
Return-path: <reiserfs-list-return-12348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <15908.25054.542735.558616@laputa.namesys.com>,
Nikita Danilov  <Nikita@Namesys.COM> wrote:
>Zygo Blaxell writes:
> > In article <15908.17236.966170.982897@laputa.namesys.com>,
> > Nikita Danilov  <Nikita@Namesys.COM> wrote:
> > >By the way, do you have REISERFS_CHECK compiled in?
> > No.  I presume I should try again with it enabled, and see if it says
> > anything interesting?
>That would be helpful.

I ran the script again and started getting Permission denied's after
20 minutes.  The kernel said:

	Jan 14 17:13:07 berkelium kernel: reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
	Jan 14 17:13:07 berkelium kernel: reiserfs:warning: - it is slow mode for debugging.
	Jan 14 17:13:07 berkelium kernel: reiserfs: checking transaction log (device 16:02) ...
	Jan 14 17:13:08 berkelium kernel: journal-1225: No valid transactions found
	Jan 14 17:13:08 berkelium kernel: journal-1299: Setting newest_mount_id to 10
	Jan 14 17:13:08 berkelium kernel: Using r5 hash to sort names
	Jan 14 17:13:08 berkelium kernel: ReiserFS version 3.6.25

...and that's all, even when repeatedly accessing and trying to
delete the offending names that point to nowhere.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
