From: markw@osdl.org
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Tue, 2 Mar 2004 09:07:25 -0800 (PST)
Message-ID: <200403021707.i22H7ZE21826@mail.osdl.org>
References: <16447.35731.535168.298454@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16447.35731.535168.298454@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: piggin@cyberone.com.au, reiserfs-list@Namesys.COM, linux-kernel@vger.kernel.org

On 27 Feb, Nikita Danilov wrote:
> The rest is not that clear. Probably you workload results in highly
> fragmented file(s). This is consistent with high CPU consumption by
> lookup_extent (http://khack.osdl.org/stp/288741/profile/profile-tick.sort).
> 
> If test doesn't delete its working files before exiting, can you execute
> 
> measurefs.reiser4 -T /device-with-reiser4
> measurefs.reiser4 -D /device-with-reiser4
> 
> and, if number of files on the file system is sane
> 
> measurefs.reiser4 -D -E /device-with-reiser4

Sorry this took a couple of days, but you can view the output of those
commands towards the end of the log file here:
	http://khack.osdl.org/stp/289045/logs/run-log.txt

You should be able to find the output by searching for the 'measurefs'
commands.

Mark
