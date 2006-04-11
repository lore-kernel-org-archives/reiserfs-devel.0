From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: reiser4 bug
Date: Tue, 11 Apr 2006 10:27:31 +0200
Message-ID: <443B6873.8070506@dermichi.com>
References: <20060410222805.d2a7074aeb6533c31cef74e88f6c8b5a.9598966e31.wbe@email.secureserver.net> <200604110954.29243.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200604110954.29243.zam@namesys.com>
Sender: mbox-dermichi@firestarter.dermichi.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Alexander Zarochentsev <zam@namesys.com>

Hi,
> it is known problem. Fixed in 2.6.17-rc1-mm2 
> (reiser4-have-get_exclusive_access-restart-transaction.patch).
as i've been burned by this bug, too i would suggest making a new patch 
for 2.6.16 including
reiser4-have-get_exclusive_access-restart-transaction.patch
or at least put a warning there that the version is unstable. i'm sure 
most people go straight for the vanilla kernel patch and don't bother 
with mm-kernels. this puts reiser4 in a bad light imo.

kind regards,
Michael
-- 
/============================================================\
|       Michael Weissenbacher <webmaster@dermichi.com>       |
|                  http://www.dermichi.com/                  |
|       Email users are divided into two classes;            |
|       1) Those who have effective spam-blocking            |
|       2) Those who wish they did                           |
\============================================================/

