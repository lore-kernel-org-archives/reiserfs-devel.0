From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 15:00:19 -0500
Message-ID: <44CE6153.7090704@slaphack.com>
References: <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org> <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731162224.GJ31121@lug-owl.de> <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl> <20060731173239.GO31121@lug-owl.de> <20060731181120.GA9667@merlin.emma.line.org> <20060731184314.GQ31121@lug-owl.de> <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net> <20060731192902.GS31121@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731192902.GS31121@lug-owl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Jan-Benedict Glaw wrote:
> On Mon, 2006-07-31 12:17:12 -0700, Clay Barnes <clay.barnes@gmail.com> wrote:
>> On 20:43 Mon 31 Jul     , Jan-Benedict Glaw wrote:
>>> On Mon, 2006-07-31 20:11:20 +0200, Matthias Andree <matthias.andree@gmx.de> wrote:
>>>> Jan-Benedict Glaw schrieb am 2006-07-31:
> [Crippled DMA writes]
>>>> Massive hardware problems don't count. ext2/ext3 doesn't look much better in
>>>> such cases. I had a machine with RAM gone bad (no ECC - I wonder what
>>> They do! Very much, actually. These happen In Real Life, so I have to
>> I think what he meant was that it is unfair to blame reiser3 for data
>> loss in a massive failure situation as a case example by itself.  What
> 
> Crippling a few KB of metadata in the ext{2,3} case probably wouldn't
> fobar the filesystem...

Probably.  By the time a few KB of metadata are corrupted, I'm reaching 
for my backup.  I don't care what filesystem it is or how easy it is to 
edit the on-disk structures.

This isn't to say that having robust on-disk structures isn't a good 
thing.  I have no idea how Reiser4 will hold up either way.  But 
ultimately, what you want is the journaling (so power failure / crashes 
still leave you in an OK state), backups (so when blocks go bad, you 
don't care), and performance (so you can spend less money on hardware 
and more money on backup hardware).
