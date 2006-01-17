From: Andrea Gelmini <dislessico@gmail.com>
Subject: Re: Bug (?) with 2.6.15-mm4
Date: Tue, 17 Jan 2006 14:51:51 +0100
Message-ID: <20060117135151.GD5105@gelma.net>
References: <20060116182241.GA5121@gelma.net> <43CBF44C.60106@feise.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43CBF44C.60106@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Feise <jfeise@feise.com>
Cc: reiserfs-list@namesys.com

On Mon, Jan 16, 2006 at 11:30:20AM -0800, Joe Feise wrote:
> I also see freezes, since 2.6.15-mm2. I did not attribute that to reiser4,
> though, since there is more in the -mm patches.
I emailed to reiser list not for the freeze, but because it seems wrong to
me that filesystem starts without complain when there's corruption/unclean
situation.[1]


ciao,
gelma

---------
[1] no filesystem flame wars, please. I don't pay and don't develop
reiser, so I've go no expectations.
