From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 12:14:32 -0800
Sender: Mike Fedyk <mfedyk@mis-mike-wstn.matchmail.com>
Message-ID: <20031110201432.GB2014@mis-mike-wstn.matchmail.com>
References: <3FAAB330.5040503@nrao.edu> <1068152041.2327.34.camel@dragonball> <3FAFF00C.1000404@ysu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FAFF00C.1000404@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Dalbec <jpdalbec@ysu.edu>
Cc: Brian Tinsley <btlists@emageon.com>, reiserfs-list@namesys.com

On Mon, Nov 10, 2003 at 03:07:40PM -0500, John Dalbec wrote:
> I've added myself to the "disk" group and it works for me as non-root.  You 
> just need read access to the raw device, no?

Yes.

But how many need access to the UUID information?  That can be a big
security hole...
