From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Tue, 17 Jun 2014 02:37:16 +0200
Message-ID: <539F8DBC.4010000@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <45271088.MxWDMbZH2T@intelfx-laptop> <539ED5B2.9060406@gmail.com> <3381547.FkGuFJAHk4@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=yinYgDGhkWNvhxi/69CHrfhM5K9DEah0A81nA+32ufo=;
        b=mVWSwT12Hq970R4VVaXL4Zjc5RjuRV6/ZRAa1kSUjZgKRlo74mr0tRb23Ny2SMrn+M
         AZvoeTZEx5i8UT9DcBc6GL6AIUvkdAUDIXVP9lwIFMG5VWEnv1u9xvGhJrllv4iYFLz6
         0kgoOdiI6a/Zv2wumqimm8bYGAtm+mjpfht3HtZMt10UHdbPerNj8d2SHFKU66PUHilh
         UXbkmoVMrNDF++tFrz4BYEvzkPcYlQL4as/IE74rM3s9okWvL3WA0DfEVv53SR+kIDP2
         Ff4JrX61TElrDXNOnPCj3nCydLA8IKT1p1aJuy2MLdfomV2Ni01q3mklkiGsV5Q+Tk0+
         GYPQ==
In-Reply-To: <3381547.FkGuFJAHk4@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/16/2014 01:47 PM, Ivan Shapovalov wrote:
[...]
>
> Are the blocknr sets comfortable?
> Say, can we organize the discard process via the blocknr_set_iterator()?
> If yes, then let's do everything via the blocknr sets (i.e. let's
> implement the
> first option). Add needed operations to blocknrset.c, the discard iteration
> actor to discard.c, etc.
> No, they aren't, and this is a problem. As I said, they are not just unsorted,
> they are unsortable as I understand them.
>


Yup, blocknr sets minimize memory consumption and are unsortable...

I think that the cleanest option will be using lists (instead of blocknr 
sets) for
the delete sets, if the discard is turned on. It will reduce memory 
consumption
by 20%. Indeed, every entry in a blocknr_set occupies ~8 bytes (assuming
that everything is pretty fragmented because of txmod=wa), whereas a list
entry occupies 32 bytes (start, length, plus 2 pointers for the link).

In this option we'll need to join lists (instead of merging blocknr 
sets) during
atoms fusion and apply the list (instead of blocknr set) to the COMMIT 
BITMAP
at pre_commit_hook(). I think it won't be a problem, since the lists are 
simpler
than blocknr sets.

The next option is to leave everything as is.
