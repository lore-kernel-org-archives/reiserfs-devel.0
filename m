From: Oleg Drokin <green@namesys.com>
Subject: Re: [Fwd: [BENCHMARK] AIM9 results]
Date: Wed, 11 Dec 2002 17:41:14 +0300
Message-ID: <20021211174114.A10526@namesys.com>
References: <3DF67316.1040107@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF67316.1040107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>, Paolo Ciarrocchi <ciarrocchi@linuxmail.org>, mason <mason@namesys.com>

Hello!

On Wed, Dec 11, 2002 at 02:04:54AM +0300, Hans Reiser wrote:
> thanks for your interesting results.  Chris and Oleg can probably 
> comment best, so I will let them do so.

As recent measurements show, block I/O speed is slower for 2.5.50+
as compared to 2.4.19, that might explain why reiserfs is slower too.
Also in between of 2.5.50 and 2.5.51 there was something fixed that led to
some block I/O improvement (not very big), and this can be observed
in these benchmark results too ;)

Bye,
    Oleg
