From: Mat <jackdachef@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.31
Date: Tue, 6 Oct 2009 12:28:02 +0200
Message-ID: <e85b9d30910060328r7deea7dak4bba307fcf995aeb@mail.gmail.com>
References: <4AC947C6.40005@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=nFQb0gsBFbIJ/JIhTJ6CxjI+u5fHfU0ftTIdDa2+VnQ=;
        b=IiBADNqdOep/c1bhIaSiQNvGFry4jGHj4jeCsz7YIbcRjPvzGzNxvDHh+ewHNdoRb+
         jwf6Lk9y1AnFe/EOyaZEUHA00EcamUax2Kii2beZ87TcHIYBHGtzkcjQ1bHbXxOcMkVW
         M2l7teCaGDwSdewsg29pUJxj5ZKg7bnromNl0=
In-Reply-To: <4AC947C6.40005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Edward,

thank you very much for the 2.6.31 patch !

Since using this patch I've observed kind of a strange behavior with
mount-options:

most of them don't work anymore !

fortunately

noatime,nodiratime,dont_load_bitmap

works


unfortunately most of the others don't:

[ 4995.449031] reiser4[mount(15761)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 4995.449033] WARNING: Unrecognized option: "tree.cbk_cache.nr_slots=48"
[ 5004.441723] reiser4: dm-2: found disk format 4.0.0.
[ 5020.825676] reiser4: dm-2: found disk format 4.0.0.
[ 5043.265530] reiser4[mount(15780)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5043.265531] WARNING: Unrecognized option: "flush.scan_maxnodes=12000"
[ 5074.032127] reiser4[mount(15784)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5074.032128] WARNING: Unrecognized option: "atom_max_size=0x3dbae"
[ 5085.407094] reiser4[mount(15785)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5085.407095] WARNING: Unrecognized option: "atom_max_size=0x3dbae"
[ 5095.823770] reiser4[mount(15787)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5095.823772] WARNING: Unrecognized option: "atom_max_age=0x3f480"
[ 5107.390510] reiser4[mount(15791)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5107.390511] WARNING: Unrecognized option: "atom_min_size=0x100"
[ 5119.973734] reiser4[mount(15792)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5119.973736] WARNING: Unrecognized option: "atom_max_flushers=0x1"
[ 5131.440685] reiser4[mount(15794)]: parse_options
(fs/reiser4/init_super.c:253)[nikita-2307]:
[ 5131.440687] WARNING: Unrecognized option: "optimal_io_size=65536"

I've seen that in fs/reiser4/init_super.c were some changes in code:

*) reiser4_init_super_data is much lower in the file

*)
static noinline void push_sb_field_opts(struct opt_desc *p,
					struct opt_desc *opts,
					reiser4_super_info_data *sbinfo)
{ ... }

was added

I don't know if those changes might be the reason why it doesn't work
anymore (the parameters perhaps are being initialized too late or not
at all)

anyways - you surely know how to fix it :)

Thanks for your continued efforts in enhancing reiser4 !

I haven't given up hope that it will be included during one of the
next merge-windows in Linus' tree

Regards

Mat
