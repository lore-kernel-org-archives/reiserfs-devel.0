From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Tue, 30 Nov 2010 01:31:54 +0100
Message-ID: <4CF445FA.7090101@gmail.com>
References: <4CE7F21B.4050605@suse.com> <4CF07C63.40408@gmail.com> <4CF408BF.8080309@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=lZl2HGHnfxOrNrVgDWJvW+iCXRiYjQ8RYHM/l52sVAE=;
        b=hEVp9VuE413X2i6CMl6OrZ4E9HgOcbBOJMGK1L/HV8/5V8IMoXprj0+1dDt9jPQ3AY
         2bAqxs1HxcfcNRjQ4CXBOeVrPuVoPgDtxhionQZhvFQMqhrvqfGHaq4RuP6vpXPmJLIX
         7DTBnCSoe0sD9pGkgXFB/ReM1yX8urmPwPhbk=
In-Reply-To: <4CF408BF.8080309@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney wrote:
> On 11/26/2010 10:34 PM, Edward Shishkin wrote:
> > Jeff Mahoney wrote:
> >>  This patch contains the basic implementation for reiserfs 3.7.
>
> >> +int has_nonstandard_journal(struct reiserfs_super_block *rs)
> >> +{
> >> +    return is_reiserfs_jr(rs) ||
> >> +           (is_reiserfs_3_7(rs) && rs->s_v1.s_journal.jp_journal_dev);
> >>  }
> >>  
> >>   
> > Actually the function above is brain damaged.
> > Journal is non-standard _iff_ it is "relocated" or has length (excluding
> > journal
> > header) different from 8192. So it can happen that a partition is
> "jr" (with
> > REISER2FS_JR_SUPER_MAGIC_STRING), but has _standard_ journal.
>
> Ok. I was under the impression that reiserfs_jr implied a nonstandard
> journal. I guess that's mistaken.

IMHO the trick is that there are "super-magics" and "super-formats"
(it is not the same).
JR_SUPER_MAGIC_STRING indicates some super-format 3.X (X = 5, 6,...)
with "possibly non-standard journal".

By default mkfs installs 3_X_SUPER_MAGIC_STRING (X = 5, 6,...).
In particular, such magic string indicates that your journal is
"untouched" (valid).
JR_SUPER_MAGIC_STRING is set by mkfs when specifying non-standard
journal parameters, or by reiserfstune when changing journal
parameters. If JR_SUPER_MAGIC_STRING is set, then actual super-format
(3.X) is located at special field sb_version.
Once JR_SUPER_MAGIC_STRING is installed, you must check journal magic
in mount time, as your journal can be invalid (replaying invalid
journal is disaster).

So I guess we need two things:
1) REISERFS_3_7_SUPER_MAGIC_STRING
2) REISERFS_FORMAT_3_7.
Next version of reiserfsprogs (3.6.22, I guess) will install
REISERFS_3_7_SUPER_MAGIC_STRING by default. Also we need to make sure
that correct super-format is installed to sb_version when updating to
JR_SUPER_MAGIC_STRING.

> It seems to me that the only thing
> wrong with the patch is the dev check and the name of the function.

I think, we don't need to change things with "jr" at all: the property to be
"jr" is common for all 3.x

> Perhaps it should be may_have_nonstandard_journal().

is_reiserfs_jr() means exactly "may have non-standard journal"
for all 3.x

> The idea wasn't to
> identify nonstandard journals but to extend the existing jr checks to
> include 3.7 checks as well.
>
> -Jeff
>

