From: Oleg Drokin <green@namesys.com>
Subject: Re: journal log file
Date: Mon, 20 May 2002 10:15:50 +0400
Message-ID: <20020520101550.A16570@namesys.com>
References: <OF3D6C20CA.2194C8A5-ONC1256BBD.0038FEA8@esade.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF3D6C20CA.2194C8A5-ONC1256BBD.0038FEA8@esade.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JPASTORM@esade.edu
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 18, 2002 at 12:30:26PM +0200, JPASTORM@esade.edu wrote:

> I'm running reiserfs with a linux 2.2.20 kernel. Where does the system
> create the journal log file for each reiserfs partition? I have currently 3

Reiserfs does not have journal "file".
In 2.2 kernel series (reiserfs v3.5) journal is placed at the beginning
of the partition explicitly (and occupies 32M).

> partitions (/, /var and /cache), and two of them were created with reiserfs
> (/var and /cache). The thing is my / partition hasn't a lot of room to keep
> the journal log file. What's the biggest size it can reach? Will I have one

For a filesystem with 4k blocksize standard journal is always 32M (and variable
blocksize or relocated journal patches won't be produced for 2.2 kernels
anyway).

> log file for each reiserfs partition? Thanks in advance.

Yes, each reiserfs filesystem have its own journal.

Bye,
    Oleg
