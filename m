From: Tom Vier <tmv@comcast.net>
Subject: Re: Data Shredding on a Journal Filesystem
Date: Thu, 26 Sep 2002 02:36:18 -0400
Message-ID: <20020926063618.GB3588@yzero>
References: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com>
 <20020925113001.A23339@namesys.com> <20020926061332.GA3588@yzero>
 <20020926102043.B5436@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20020926102043.B5436@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, Sep 26, 2002 at 10:20:43AM +0400, Oleg Drokin wrote:
> > of course, putting sensitive files on a loopback encrypted fs is better.
> > then you don't have to worry about plaintext laying around, and you don't
> > need shred or wipe.
> 
> You also need to be careful so that this sensitive data won't get into swap.

also, .bash_history can reviel filenames.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
