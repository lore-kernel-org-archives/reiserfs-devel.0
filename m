From: Oleg Drokin <green@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released ...
Date: Fri, 25 Apr 2003 12:47:42 +0400
Message-ID: <20030425084742.GA22827@namesys.com>
References: <1051258287.5564.1.camel@fortknox> <1051259723.3513.7.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051259723.3513.7.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Apr 25, 2003 at 10:35:23AM +0200, Soeren Sonnenburg wrote:

> The filesystem was freshly created (today) and 10G were tarred on the
> disk...
> the /home partition is reiserfs (where that file is on), / is ext3
> As I was using reiserfs for a quite long time on any kind of i386
> hardware I guess it is a little/big endian issue.

There are no known endianness issues in reiserfs code now.
You di not had reboot or something like that after you copied the data over?
What is the latest reiserfsck reports for your fs?

Bye,
    Oleg
