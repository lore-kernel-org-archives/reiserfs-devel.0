From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs versions
Date: Tue, 19 Nov 2002 18:08:48 +0300
Message-ID: <20021119180848.A27946@namesys.com>
References: <3DD97831.4030607@panix.com> <20021119093526.A32026@namesys.com> <3DD9EC4B.70907@panix.com> <20021119105123.A3473@namesys.com> <3DDA5320.9070605@panix.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DDA5320.9070605@panix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kenny gorman <kgorman@panix.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Nov 19, 2002 at 07:05:04AM -0800, kenny gorman wrote:
> I am sorta confused.  I downloaded and compiled the latest 
> reiserfsprogs, I also updated my rpm.  How do I know what version I am 
> runnning then?
reiserfsck -V will tell you what version is in your path.

> rpm -q shows reiserfs-3.x.0k_pre10-8, but in /usr/local/sbin I have the 
> latest 3.6.4 stuff.  How can I be sure my system is updated correctly? 
> Should I remove the rpm?

Right now you probably have more recent version later in the path, so
you might want to remove the rpm.
Or you may build another RPM off our newer sources.

Bye,
    Oleg
