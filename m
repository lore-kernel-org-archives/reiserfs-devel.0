From: "Tom Evans" <tom@23palmer.net>
Subject: RE: Bitmap alignment issues....
Date: Tue, 15 Feb 2005 16:37:29 -0500
Message-ID: <3pan5q$2kae4@smtp04.mrf.mail.rcn.net>
References: <20050215183011.GU7482@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050215183011.GU7482@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Zarochentsev' <zam@namesys.com>
Cc: reiserfs-list@namesys.com


>do you see aligment faults in the bitmap code after my patch?

The patch that was presented a few days ago caused corruption of the volume.
I used a "patch" I did that simply used the unaligned macros.

I will try the new patch this evening.

Thanks,

...tom

