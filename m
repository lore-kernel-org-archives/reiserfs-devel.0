From: Mathieu Segaud <matt@minas-morgul.org>
Subject: Re: Bug report: slab error at module removal
Date: Mon, 16 Aug 2004 22:52:48 +0200
Message-ID: <87vffierfj.fsf@barad-dur.crans.org>
References: <87pt5uibur.fsf@barad-dur.crans.org>
	<20040815161604.GB4703@backtop.namesys.com>
	<87d61sjhml.fsf@barad-dur.crans.org>
	<20040816142317.GH4703@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040816142317.GH4703@backtop.namesys.com> (Alex
 Zarochentsev's message of "Mon, 16 Aug 2004 18:23:17 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alex Zarochentsev <zam@namesys.com> writes:

> ah, sorry, the fix was wrong, try this one:

This time, module removal issues no slab error.
Thanks a lot. It will sit in my patchset till next snapshot :-)

Regards,

-- 
Mathieu Segaud

