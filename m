From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs equivalent of ext2's -m?
Date: Wed, 10 Jul 2002 09:06:55 +0400
Message-ID: <20020710090655.A4451@namesys.com>
References: <20020709190230.D4AA7F59E@tater>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020709190230.D4AA7F59E@tater>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pll@lanminds.com
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jul 09, 2002 at 03:02:30PM -0400, pll@lanminds.com wrote:

> Does ReiserFS have something equivalent to ext2fs' -m switch which 
> allows you to manipulate the 'min-free' overhead?

No.

> Does ReiserFS even have a reserved overhead allocation?

There is 200 blocks reserved for FSs purposes that user cannot use, but
fsck can use for example. That's all for now.

Bye,
    Oleg
