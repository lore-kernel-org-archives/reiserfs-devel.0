From: Willy Tarreau <w@1wt.eu>
Subject: Re: Is it time to remove reiserfs?
Date: Mon, 4 Apr 2022 12:18:02 +0200
Message-ID: <20220404101802.GB8279@1wt.eu>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
 <20220402105454.GA16346@amd>
 <20220404085535.g2qr4s7itfunlrqb@quack3.lan>
 <20220404100732.GB1476@duo.ucw.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220404100732.GB1476@duo.ucw.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Hi Pavel,

On Mon, Apr 04, 2022 at 12:07:32PM +0200, Pavel Machek wrote:
> > Well, if someone uses Reiserfs they better either migrate to some other
> > filesystem or start maintaining it. It is as simple as that because
> > currently there's nobody willing to invest resources in it for quite a few
> > years and so it is just a question of time before it starts eating people's
> > data (probably it already does in some cornercases, as an example there are
> > quite some syzbot reports for it)...
> 
> Yes people should migrate away from Reiserfs. I guess someone should
> break the news to Arch Linux ARM people.
> 
> But I believe userbase is bigger than you think and it will not be
> possible to remove reiserfs anytime soon.

I was about to say the opposite until I noticed that one of my main
dev machine has its kernel git dir on it because it's an old FS from
a previous instance of this machine before an upgrade and it turns out
that this FS still had lots of available space to store git trees :-/

So maybe you're right and there are still a bit more than expected out
there. However I really think that most users who still have one are in
the same situation as I am, they're not aware of it. So aside big fat
warnings at mount time (possibly with an extra delay), there's nothing
that will make that situation change.

At the very least disabling it by default in Kconfig and in distros
should be effective. I really don't think that there are still users
who regularly update their system and who have it on their rootfs, but
still having data on it, yes, possibly. The earlier they're warned,
the better.

At least now I know I need to migrate this FS.

Regards,
Willy
