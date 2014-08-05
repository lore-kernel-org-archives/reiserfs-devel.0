From: Jeff Chua <jeff.chua.linux@gmail.com>
Subject: Re: [PATCH] reiserfs: fix corruption introduced by balance_leaf refactor
Date: Wed, 6 Aug 2014 03:23:58 +0800
Message-ID: <CAAJw_Zs0Kx_NTbi4uvvOp3NiKv9-VQJoN+LXU-mrz+2Ve2djEQ@mail.gmail.com>
References: <53E01C93.4050801@suse.com>
	<20140805083902.GA19945@quack.suse.cz>
	<CAAJw_Zuqs+3OFCaQC8AcPP1cVgMnhQgc6GxB+Uyrby80fe3rLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=EeTAALT6rfaUFFcjrCqLwvh0xRSL32qes9Knrh2iCxE=;
        b=PEblf3HEkekpseK77gIN2F+C1STLEEKgjuPs/lAZreOTapCX27mosqXP5pcPZFpzbh
         Qw9QuEQuKQyBoa0q4VdgELL+pcTMdBq06y9b4mote+s+hUVHaafk1jjsuqnwIBpwo7tm
         jN7IDeKtvVNmLc3wnIBdUEnrUXOhqzfpV4qABtuH0ViTgvzEdhGwPnObGPvIOqd7IsSw
         kK160Ya+3fNqf8CjDNMnlr4tAtEmeqvIRjH5KIz8pK7p2/WoXf1/TFkpH5+9sm0lyHcL
         1ydDyUQur03l+i4CVCFRWUb+7ddgfg75KZXZ6XSxxO98I0lBhRDGB8NUiZ8pRt4FvneJ
         g11w==
In-Reply-To: <CAAJw_Zuqs+3OFCaQC8AcPP1cVgMnhQgc6GxB+Uyrby80fe3rLQ@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, stable@vger.kernel.org

On Tue, Aug 5, 2014 at 5:28 PM, Jeff Chua <jeff.chua.linux@gmail.com> wrote:
> On Tue, Aug 5, 2014 at 4:39 PM, Jan Kara <jack@suse.cz> wrote:
>> On Mon 04-08-14 19:51:47, Jeff Mahoney wrote:
>>> Commits f1f007c308e (reiserfs: balance_leaf refactor, pull out
>>   Thanks. I've added the patch to my tree and I'll push it to Linus in this
>> merge window (after basic test runs finish).
>
> It's holding so far. I'm compiling mozilla brower, xul-runner and gcc
> now and all the compilings are still running in vmware ... not yet
> finished though.
>
> Then, I'll run more tests on my real h/w.

Jan, Jeff,

Running on real h/w with many more compilations ... all good. No
coruptions. Patch worked!

Thanks,
Jeff.
