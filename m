From: Domenico Andreoli <cavok@libero.it>
Subject: Re: raid0 and rfs4
Date: Tue, 13 Jan 2004 15:06:18 +0100
Message-ID: <4003FB5A.3040606@libero.it>
References: <1073970028.20855.18.camel@www.vox.net>	<16387.51811.609993.908345@laputa.namesys.com>	<1073993642.6832.1.camel@leto.cs.pocnet.net>	<16387.55499.926184.907602@laputa.namesys.com>	<4003F6C1.3000707@libero.it> <16387.63814.532141.196442@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16387.63814.532141.196442@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Nikita Danilov wrote:
> Domenico Andreoli writes:
>  > Nikita Danilov wrote:
>  > > Christophe Saout writes:
>  > >  > Am Di, den 13.01.2004 schrieb Nikita Danilov um 11:37:
>  > >  > 
>  > >  > > Hmm, probably raid is not happy that reiser4 sends so large bios to it.
>  > >  > 
>  > >  > You must call the queue->merge_bvec_fn to ask how big you can make your
>  > >  > bio.
>  > > 
>  > > Right. Or just use bio_add_page() to construct bios, which seems to be
>  > > canonical way now-days.
>  > > 
>  > so is reiser4 already doing the right thing?
> 
> Yes, with a little help of the patch I sent few minutes ago.
>
i've just seen it...

>  > i'm not a filesystem guru, even if i'd like to study them a little (any 
>  > good suggestion for a newbie?), and i have not any idea about what is a 
>  > "bio", but these day i was thinking about moving my raid0 from reiserfs 
>  > to reiser4 and this story interests me a lot.
> 
> "bio" (from Block Input-Output) is an entity used by the rest of the
> linux kernel to communicate with block IO sub-system. Basically, it is a
> mapping from a contiguous portion of block device to an array of regions
> in the memory (think of readv(2), writev(2)). Block IO subsystem
> provides calls to start read/write through this map. File system uses
> bio's to write/read its data and meta-data.
> 
yes i definitively need a good book and some knowledge of linux kernel 
internals... thanks :)

domenico

-----[ Domenico Andreoli, aka cavok
  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
