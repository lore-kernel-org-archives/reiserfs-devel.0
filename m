From: "Elias Ignacio Contreras" <enito@eudoramail.com>
Subject: Re: PLZ HELP, my 160gb 's DANGER :(
Date: Tue, 04 Mar 2003 20:51:56 -0800
Message-ID: <GPCLEKIALEKNHBAA@whowhere.com>
Reply-To: enito@eudoramail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Language: en
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

 
--

On Mon, 3 Mar 2003 09:29:02   
 Oleg Drokin wrote:
>Hello!
>
>On Sat, Mar 01, 2003 at 11:26:20PM -0800, Elias Ignacio Contreras wrote:
>
>>  cause this one is the trouble apparently, my assign table is fucked, i can mount dev/hde like without a defined partition, oh my god :(
>> plz tell me a tip :(
>> i can mount the disk but...i wanna fix the trouble of fdisk tell kme about no partition defined
>
>Well, since you apparently created the FS on /dev/hde (entire device), if you need partition table now,
>you should first backup all the data off the filesystem to some other place, then create valid
>partition table, create reiserfs partition, mkfs it, mount it and
>then copy the data back. Don't forget to change /etc/fstab to mount correct thing at boot after that.
>
oh yeah you have reason, i discovered this one like 2 days thinking...that's was my trouble,

thanks to all for your help

thx 


>Bye,
>    Oleg
>


Need a new email address that people can remember
Check out the new EudoraMail at
http://www.eudoramail.com
