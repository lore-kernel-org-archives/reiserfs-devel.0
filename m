From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 w. cryptcompress data-corruption (?!)
Date: Tue, 26 Feb 2008 13:38:24 +0300
Message-ID: <47C3EC20.8010208@gmail.com>
References: <loom.20080225T213801-660@post.gmane.org>	 <a08621850802251503w10b88e3an59a5170dd41805bb@mail.gmail.com> <e85b9d30802260057s5ed62dc6t78fc5b6cfb02a5da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30802260057s5ed62dc6t78fc5b6cfb02a5da@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew <jackdachef@gmail.com>
Cc: Dushan Tcholich <dusanc@gmail.com>, reiserfs-devel@vger.kernel.org

Matthew wrote:

>On Tue, Feb 26, 2008 at 12:03 AM, Dushan Tcholich <dusanc@gmail.com> wrote:
>  
>
>>Hi
>>
>>I had a same scary experience of reiser4 repairing thousands of errors on
>>cryptocompressed partition, but it was false alarm as Edward said:
>>
>>    
>>
>>>Me:
>>>      
>>>
>> > After fsck.reiser4 --check I had to do a fsck.reiser4 --build-fs,
>> > which lasted ~55min. It fixed 1 error on the start and for next 50 min
>> > fixed wrong bytes errors in every node, like in the second picture.
>>
>>Edward:
>> Ignore reports about wrong bytes.
>> This is because cryptcompress plugin doesn't keep a track about bytes,
>> and fsck calculates and insert correct value. Keeping a track of bytes
>> by kernel leads to performance drop (even worse then with atime), so
>> we decided to not support it.
>>
>>
>>Were those thousands of errors in step 6. of your mail wrong byte errors?
>>
>>Dushan
>>    
>>
>
>Hi, Dushan,
>
>no, those actually were (real) data corruption errors,
>as I wrote (I didn't made it that clear) I impatiently interrupted
>fsck.reiser4, reformatted the partition and extracted the tarball with
>the system
>
>I just woke up & thinking over it now: the corruption behavior was
>pretty similar to the corruption with bitdefender-console,
>
>Edward:
>I hope you still have the mails were I described
>"corrupting"/triggering the error with ntfs-scanning before you fixed
>it?
>
>1.) boot into system with reiser4 as root partition
>2.) start up GUI (gnome, kde, whatever)
>3.) work with with it a little
>4.) mount ntfs-partition (it shouldn't matter if mounted with
>in-kernel ntfs-driver or ntfs3g) [the partition should ideally contain
>a windows-system with several gigabytes of data]
>5.) scan the partition with bdc --arc --files /mnt/win
>  
>

what is the bdc?

>6.) filesystem corrupts,
>7.) result: nothing can be launched anymore, even bash is broken -
>just everything
>
>it was also the case this time:
>whenever I tried to launch epiphany, nautilus, gnome-terminal it
>wouldn't launch them
>--> the only thing still working was gnome-terminal
>after that I exited to the CLI & when I recognised it was similar to
>the previous corruption case (bitdefender-console)
>I immediately killed everything via magic sysrq key & rebooted without
>syncing to maintain my data intact (on /home)
>
>the behavior is pretty interesting:
>it seems to corrupt progressively in steps (such as with the
>bitdefender-console corruption)
>
>first almost all still works, bit by bit more and more programs won't
>work anymore
>
>Regards
>
>Mat
>
>  
>

