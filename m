From: Oleg Drokin <green@namesys.com>
Subject: Re: write barrier patches for 2.4.21
Date: Thu, 4 Sep 2003 18:56:04 +0400
Message-ID: <20030904145604.GB10715@namesys.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero> <20030827064103.GA29131@namesys.com> <3F55153B.1060808@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F55153B.1060808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Wed, Sep 03, 2003 at 02:10:03AM +0400, Hans Reiser wrote:
> >There was a discussion about that on Kernel Summit 2003 and general 
> >opinion was that SCSI
> >does not need the WB stuff at all as it does the correct thing anyway.
> define "correct thing".


As I understood it, they do not do reordering or do it in a way
that does not make this reordering visible after crash.

Bye,
    Oleg
