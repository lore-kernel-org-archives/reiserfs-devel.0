From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Red Hat Enterprise Linux AS (v. 2.1) and  > 2 GB files
Date: Fri, 27 Jun 2003 15:51:57 +0400
Message-ID: <16124.12253.655810.956151@laputa.namesys.com>
References: <1056635615.1967.377.camel@atlas.vinterbro.com>
	<20030626155842.2c7fd748.pegasus@nerv.eu.org>
	<3EFB1F97.3020205@namesys.com>
	<20030627065918.GA20771@namesys.com>
	<20030627125003.A32245@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627125003.A32245@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Alexander Lyamin writes:
 > Fri, Jun 27, 2003 at 10:59:18AM +0400, Oleg Drokin wrote:
 > > Hello!
 > > 
 > > On Thu, Jun 26, 2003 at 08:30:15PM +0400, Hans Reiser wrote:
 > > 
 > > > >Because RedHat never bothered to update reiserfs code in their e kernels.
 > > > >Your best bet is to get a newer kernel, perhaps 2.4.21, and if you cannot
 > > > >afford that, trim your app to not create files that big.
 > > > >There are rumors that 2.4.18 based e kernel is in the testing ... 
 > > > You mean RedHat is STILL shipping 2.4.9 based kernels?  Oh no wonder 
 > > > there are people with stability problems.....
 > > 
 > > No, I believe there was kernel update last month that upgraded RHAS kernel up to
 > > 2.4.18.
 > > Anyway RHAS 2.4.9 kernel does not have that much in common with vanilla 2.4.9.

Really? It is easy to calculate a number of lines of the code that are
different in Red Top Hat kernels, and it is highly doubtful, that more
than half are changed (least which would qualify as "does not have that
much in common").

 > 
 > If there's nothing much in common with vanilla linux, then they should not 
 > mislead their customers with "linux" label on it, but should fork and do 
 > something like Reddix or Hattix 2.4.9 .

Reiserfs was to much extent -only- successful because SuSE generously
shipped, and supported it long before it was included into vanilla
kernel. Face it.

 > 
 > Sometimes I really getting lost in marketting tricks of thouse guys.
 > 
 > > Bye,
 > >     Oleg
 > 
 > -- 
 > everything zen
 > lex lyamin

Nikita.
