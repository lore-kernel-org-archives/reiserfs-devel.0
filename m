From: Oleg Drokin <green@namesys.com>
Subject: Re: Data Shredding on a Journal Filesystem
Date: Thu, 26 Sep 2002 10:20:43 +0400
Message-ID: <20020926102043.B5436@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com> <20020925113001.A23339@namesys.com> <20020926061332.GA3588@yzero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020926061332.GA3588@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Sep 26, 2002 at 02:13:32AM -0400, Tom Vier wrote:

> of course, putting sensitive files on a loopback encrypted fs is better.
> then you don't have to worry about plaintext laying around, and you don't
> need shred or wipe.

You also need to be careful so that this sensitive data won't get into swap.

Bye,
    Oleg
