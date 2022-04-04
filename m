From: Willy Tarreau <w@1wt.eu>
Subject: Re: Is it time to remove reiserfs?
Date: Mon, 4 Apr 2022 15:16:22 +0200
Message-ID: <20220404131622.GC8279@1wt.eu>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
 <20220402105454.GA16346@amd>
 <20220404085535.g2qr4s7itfunlrqb@quack3.lan>
 <20220404100732.GB1476@duo.ucw.cz>
 <20220404101802.GB8279@1wt.eu>
 <20220404125541.tvcf3dwyfvxsnurz@quack3.lan>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220404125541.tvcf3dwyfvxsnurz@quack3.lan>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Pavel Machek <pavel@ucw.cz>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Mon, Apr 04, 2022 at 02:55:41PM +0200, Jan Kara wrote:
> Yes, we start with a warning now. Say a year before we really do remove it,
> my plan is to refuse to mount it unless you pass a "I really know what I'm
> doing" mount option so that we make sure people who possibly missed a
> warning until that moment are aware of the deprecation and still have an
> easy path and some time to migrate.

That's a good idea. I was thinking as well about something manual (e.g.
manually modprobe the FS) but an option will be even better.

Willy
