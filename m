From: Enrique Perez-Terron <enrio@online.no>
Subject: Re: secure delete?
Date: Thu, 25 Mar 2004 00:18:08 +0100
Message-ID: <1080170284.11768.1306.camel@arabia.home.lan>
References: <Pine.LNX.4.44.0403240625080.18021-100000@potato.zayda.com>
	 <40613E9A.9090605@namesys.com>
	 <1080115473.1976.219.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080115473.1976.219.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

A few years ago a university administration staff member asked an
assistant to  wipe out all his files in preparation for retirement.
He got angry when he soon found his web searches in the browser history
and cache, and asked how is that possible.

No "secure" delete would have helped him, but standard delete would have
been fully adequate had he only known what to delete. There was no
chance in hell that anyone would engage in a block device scanning of
his abandoned disk, much less track alignment variation analysis.

Such are the vast majority of the cases.

Even moderate security is a challenge, and a "secure delete" facility is
one of the tools. Considering how the word processors create recovery
files, auto-saves, backups, how the documents get automatically indexed,
there are many parts of this equation.

On the other hand, it is not completely true that encryption does not
help against track alignment analysis because "they" can find the key
file and beat the passphrase out of me. Beating the passphrase out of me
can easily become quite expensive - not only for me :). In addition,
there is no guarantee that the writes of sensitive material will happen
with any larger misalignment than usual, to make those bits reliably
recoverable. Even though sophisticated methods can reveal up to twenty
layers of old data, they can only do so with an increasingly high bit
error rate. It does not take many bit errors to ruin the prospect of
decryption, except for the most outlandish recovery budgets.

So, even a fairly cheap and quick encryption system combined with a
"secure delete" facility makes it many orders of magnitude more
expensive to recover any information from the disk. While it is hardly
the first priority, there might still be many customers that will one
day be willing to pay for this.

Regards, 
Enrique

