From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Compile probs with yesterday's auto-snapshot
Date: Wed, 11 Aug 2004 14:25:40 +0400
Message-ID: <4119F424.6030806@namesys.com>
References: <20040810192756.67EC115C33@mail03.powweb.com> <20040810212752.44a3dde7.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810212752.44a3dde7.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

Hello

Adrian Ulrich wrote:
>>1. Only i386 and UML on i386 are supported.
>>ddabbs: Big endian appears to be supported.
> 
> 
> I don't think so.
> 
> Mounting a reiser4 partiton on ppc-linux doesn't work
> (mount segfaults + kernel Oops)
> 
> I created the FS on x86, so it's not the fault of mkfs.reiser4
> (I didn't even compile the userland-tools on ppc-linux)
> 
> 
> Does namesys plan to support Big endian soon?
> 

Yes. The only problem is lack of hardware.

