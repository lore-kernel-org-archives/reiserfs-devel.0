From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 01 Aug 2006 05:36:31 -0600
Message-ID: <44CF3CBF.8050600@namesys.com>
References: <200607312314.37863.bernd-schubert@gmx.de>	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch>	 <1154446189.15540.43.camel@localhost.localdomain>	 <44CF84F0.8080303@slaphack.com> <1154452770.15540.65.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154452770.15540.65.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Vitaly Fertman <vitaly@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Alan, I have seen only anecdotal evidence against reiserfsck, and I have
seen formal tests from Vitaly  (which it seems a user has replicated)
where our fsck did better than ext3s.  Note that these tests are of the
latest fsck from us: I am sure everyone understands that it takes time
for an fsck to mature, and that our early fsck's were poor.  I will also
say the V4's fsck is more robust than V3's because we made disk format
changes specifically to help fsck.

Now I am not dismissing your anecdotes as I will never dismiss data I
have not seen, and it sounds like you have seen more data than most
people, but I must dismiss your explanation of them. 

Being able to throw away all of the tree but the leaves and twigs with
extent pointers and rebuild all of it makes V4 very robust, more so than
ext3.  This business of inodes not moving, I don't see what the
advantage is, we can lose the directory entry and rebuild just as well
as ext3, probably better because we can at least figure out what
directory it was in.

Vitaly can say all of this more expertly than I....

Hans
