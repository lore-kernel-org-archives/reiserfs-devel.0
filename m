From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Mon, 19 May 2003 12:22:25 +0200
Message-ID: <3EC8B061.6050300@gmx.net>
References: <200305172030.58775.russell@coker.com.au> <3EC61987.5000402@gmx.net> <200305172125.59713.russell@coker.com.au> <3EC6247C.4030605@gmx.net> <20030517121038.GA929@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030517121038.GA929@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Oleg Drokin wrote:

> BTW, were there any news on "reiserfs corruptions on crypto loop mounted devices" tests with 2.4.21-rc2?

Unfortunately, I wasn't successful in reproducing the corruption. OTOH,
I now use reiserfsprogs 3.6.7 instead of 3.6.4 before. Were there any
fixes committed to resize_reiserfs in the meantime?

What strikes me as odd is the fact that vs-5150 errors seem to coincide
with resizing when you look at past messages to the list.

Do your data structures grow linearly or to next 2^n bytes with
filesystem size? The last resize operations I tried did not cross any
2^n bytes boundary, while the ones before corruption crossed 512 MB,
1024 MB, 2048 MB boundary respectively.

Another shot in the dark: maybe resize_reiserfs does not update/check
the node level correctly, i.e. it checks against correct values before
resize instead of after resize?

Regards,
Carl-Daniel

