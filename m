From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Thu, 27 Jul 2006 20:40:19 -0600
Message-ID: <44C97913.6000607@namesys.com>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com> <20060726131709.GB5270@ucw.cz> <Pine.LNX.4.63.0607271732010.8976@alpha.polcom.net> <20060727172852.GA11321@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060727172852.GA11321@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Grzegorz Kulewski <kangur@polcom.net>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Matthias Andree wrote:

>I wonder what makes the hash overflow issue so complicated (other than
>differing business plans, that is) that upgrading in place isn't
>possible. Changes introduce instability, but namesys were proud of their
>regression testing - so how sustainable is their internal test suite?
>  
>
>
Never met a test suite the equal of a few million users.....

People have this image of Namesys as some large corporation that has
large resources.  We just barely are going to be able to ship reiser4,
at the cost of a LOT of financial pain.  We can't afford to go in two
directions at once.  We can add bugfixes to V3, but adding features, I
have to tell you that we ain't got the staff for both that and shipping
V4.  Our whole corporation has a budget about what most corporations
spend on two programmers.   We have 5 developers, including me, and
making little bits of money is a constant distraction from the main work.

Hans
