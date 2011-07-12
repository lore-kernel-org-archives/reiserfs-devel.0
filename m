From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [PATCH] fixlet: Remove fs_excl from struct task.
Date: Tue, 12 Jul 2011 08:29:40 +0200
Message-ID: <4E1BE9D4.7020006@fusionio.com>
References: <1308949107-1962-1-git-send-email-teravest@google.com> <20110624220240.GA6455@infradead.org> <CAN5ZDdfVEvxgwmRPwMVSq7iqTTaQ5fi5A-qtCsiqzTRjhOuL+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN5ZDdfVEvxgwmRPwMVSq7iqTTaQ5fi5A-qtCsiqzTRjhOuL+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Justin TerAvest <teravest@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "jeffm@suse.de" <jeffm@suse.de>, "tytso@google.com" <tytso@google.com>, "mingo@elte.hu" <mingo@elte.hu>, "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>

On 2011-07-11 22:44, Justin TerAvest wrote:
> Jens,
> 
> Have you had a chance to look at this? Christoph mentioned you'd
> wanted to keep this,
> but the last discussion I see is from 2009 and it doesn't look like
> much has happened since then.

Lets kill it! I'm pulling your patch into the 3.1 core branch.

-- 
Jens Axboe
