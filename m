From: Oleg Drokin <green@namesys.com>
Subject: Re: [PAID PRIORITY SUPPORT REQUEST] Quotas not fully working in 2.4.21-pre5
Date: Sat, 5 Apr 2003 15:32:05 +0400
Message-ID: <20030405153205.B2147@namesys.com>
References: <20030405024529.71d46842.philippe.gramoulle@mmania.com> <20030405114200.A984@namesys.com> <20030405131118.215367f2.philippe.gramoulle@mmania.com> <20030405152215.A2147@namesys.com> <20030405132826.4756fa82.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030405132826.4756fa82.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>, reiserfs-dev@namesys.com

Hello!

On Sat, Apr 05, 2003 at 01:28:26PM +0200, Philippe Gramoull? wrote:
>   | # CONFIG_QIFACE_COMPAT is not set
>   | suggests that you do not have compatibility stuff enabled.
> I didn't need compatibility. We use the new vfsv0 format.

It have nothing to do with format.
This is compat interface tools<->kernel, as I understand it.

Bye,
    Oleg
