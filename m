From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 18:19:42 +0300
Message-ID: <4384888E.2040407@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <200511231253.37328.mail@earthworm.de> <20051123121751.GC26252@favonius> <200511231321.18455.mail@earthworm.de> <20051123122809.GA31528@favonius> <43846A0C.6010808@namesys.com> <20051123151016.GA7768@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051123151016.GA7768@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: "Hesse, Christian" <mail@earthworm.de>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

Hello

Sander wrote:
> Vladimir V. Saveliev wrote (ao):
>>Please unapply the attached patch and check whether it makes any effect.
> 
> Is there any risk involved in testing this patch?

It should not. The only problem it will cause is not updating atime on accessing
files.

> 
> And is this a real patch which fixes a real problem, or is it a test?
> 

No. This is not a fix. This is a patch which I suspect is responsible for sync
performance drop. It fixes old reiser4 bug known as "not updating atime".
I asked you to reverse this patch to check whether this patch caused recent sync
 performance degradation.
