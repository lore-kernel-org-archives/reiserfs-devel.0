From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Stupid question
Date: Thu, 27 May 2004 12:51:11 +0300
Message-ID: <20040527095111.GP4990@nysv.org>
References: <200405271138.20701.marcel@hilzinger.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405271138.20701.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

On Thu, May 27, 2004 at 11:38:20AM +0200, Marcel Hilzinger wrote:
>What, if someone likes to create a directory called "metas" under reiser4? 

That's a can of worms opened many times too often.

>Actually this is not possible, as the system will complain about: "there is 
>already a directory metas".

Yes.

I recommend patching it to ..metas/

NEEXT!

-- 
mjt

