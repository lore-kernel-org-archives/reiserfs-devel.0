From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 15:07:40 -0500
Message-ID: <3FAFF00C.1000404@ysu.edu>
References: <3FAAB330.5040503@nrao.edu> <1068152041.2327.34.camel@dragonball>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068152041.2327.34.camel@dragonball>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Tinsley <btlists@emageon.com>
Cc: reiserfs-list@namesys.com



Brian Tinsley wrote:

> On Thu, 2003-11-06 at 14:46, Boyd Waters wrote:
> 
> 
>>-----BEGIN PGP SIGNED MESSAGE-----
>>Hash: SHA1
>>
>>Perhaps this is obvious, but I cannot find a way to print out the UUID
>>or the label of a mounted reiser filesystem, in a manner similar to
>>xfs_admin.
>>
>>Best way to do this?
> 
> 
> 
> debugreiserfs /dev/xxx
> 
> 
> 
>>On a mounted filesystem?
> 
> 
> 
> Yes.
> 
> 
> 
>>As non-root user?

I've added myself to the "disk" group and it works for me as non-root.  You just 
need read access to the raw device, no?
John
> 
> 
> 
> Doubtful
> 
> 

