From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: LVM array, one disk failed
Date: Tue, 7 Jan 2003 14:40:24 +0300
Message-ID: <200301071440.24198.vitaly@namesys.com>
References: <1041044851.5964.32.camel@ganga> <20030106100157.A1881@namesys.com> <1041878024.6748.22.camel@ganga>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1041878024.6748.22.camel@ganga>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tuomas Jormola <tjormola@cc.hut.fi>
Cc: reiserfs-list@namesys.com


Hi,

> Thanks for the tip and it indeed works better than 3.6.4. But now it
> exists with return value 8 and message "Operation not permitted" while
> executing write() inside bwrite() of lib/io.c. Isn't it odd that
> lseek64() before that is OK but write fails? And yes, it's run as root.
> I've attached strace and ltrace logs of the reiserfsck session, perhaps
> they tell you something.

This is probably an evms problem - evms detected some changes and does not 
allow to write there. Evms people know more about it, ask them please.

-- 

Thanks,
Vitaly Fertman
