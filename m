From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: vs-13070: reiserfs_read_locked_inode during backup (rsync) &
 much load on VFS
Date: Tue, 26 Aug 2008 19:36:58 +0400
Message-ID: <48B4231A.5050901@gmail.com>
References: <loom.20080825T132117-502@post.gmane.org>	 <e85b9d30808250658v6ceb518ajf4f86f29ee0d40aa@mail.gmail.com>	 <48B31A55.8020304@gmail.com> <e85b9d30808260525p4a9d531fja20b4bb39864cf9f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30808260525p4a9d531fja20b4bb39864cf9f@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Mat wrote:
> On Mon, Aug 25, 2008 at 10:47 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>   
>> Matthew wrote:
>>     
>>> ok, well it turned out to be an USB problem (again !)
>>>
>>>       
>> bad cable?
>>     
>
> almost ;)
> it was a bad usb-hub, strangely those tweaked settings pushed it to
> its limits and
> therefore would produce those errors more earlier / often than without
> (if at all)
>   

Hmm..
It seems we have never had "unplug-usb-drive-under-heavy-load"
as a stress test. It seems better then "reboot -fn"..
I definitely want a usb drive ;)

> by the way:
> any news from the Russian company planning to implement reiser4 for
> its servers ?
>   

The latest update is that it will be available
for public needs in October. We'll take a look ;)


Edward.
