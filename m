From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sun, 20 Apr 2003 08:44:16 +0200
Message-ID: <3EA241C0.6080600@netscape.net>
References: <20030419230654.GF26352@cheney.cx> <F592E162-72C9-11D7-ADF3-00050285B655@ncpro.com> <20030420034150.GP32700@zewt.org> <3EA23B72.9020606@netscape.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080906060707070903030304"
Return-path: <reiserfs-list-return-13736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>

--------------080906060707070903030304
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2003 08:17 AM, Manuel Krause wrote:
> On 04/20/2003 05:41 AM, Glenn Maynard wrote:
> 
>> Trimmed CC: little; I can't imagine why this should go to -testing ...
>>
>> On Sun, Apr 20, 2003 at 02:49:36AM +0200, Marcel Weber wrote:
>>
>>> All I can say to this is: use what you like, resp. if you don't like 
>>> bloated software or spamware do not use it. My point is, that it 
>>> should be a right of the original authors of the software to include 
>>> credits. If someone else does a complete rewrite of the software, 
>>> okay than we can discuss it, but if the rewrite means only the 
>>> removal of the credits it is questionable.
>>
>>
>>
>> This is irrelevant.  We're not questioning whether Hans Reiser has the
>> right to license his own software to prohibit the removal of large
>> messages.  The questions being asked are:
>>
>> 1. Is software licensed in the manner Hans intends DFSG-free?  That is,
>> is it DFSG-free to require that interactive programs output a full
>> page of sponsorship information?  (That's a question for debian-legal.)
>> If not, it can not be distributed in Debian and will be relegated to
>> non-free.
>>
>> 2. Is the software licensed consistently?  If not, it's probably not
>> legally safe to distribute at all, and will be removed entirely unless
>> Hans clarifies the licensing.
>>
>> Another question that comes to mind: has ReiserFS used code from projects
>> licensed under the GPL?  If so, he can not, in fact, place this extra
>> restriction, as it would be in violation of GPL clause 6.  This isn't a
>> special issue for programs under completely different licenses; they know
>> they're not GPL-compatible and don't use GPL code.  However, when people
>> use "modified" GPL licenses, they often don't realise that they can no
>> longer use code from other GPL projects.
>>
>>
>>> But first of all, before we continue this discussion: What exactly 
>>> has been removed? A readme file, the outputs during boot time, the 
>>> outputs of mkfs.reiserfs? Has this output any impact on the usability 
>>> of the software, so that there were good reasons the remove it? Has 
>>> the license been violated by removing the credits?
>>
>>
>>
>> It's been suggested that the removed message is the one referenced in
>> this bug report:
>>
>>   http://bugs.debian.org/cgi-bin/bugreport.cgi?archive=no&bug=152547
>>
>> Impact and "good reasons" don't matter.  Debian requires that users be
>> granted the right to do certain things regardless of whether they have
>> "good reasons".  If Hans doesn't want to grant those rights to users,
>> that's may be his choice, but Debian won't distribute his software.
>>
> 
> I find this discussion quite annoying. I thought war is over now?! This 
> discussion seems to come up every year now.
> 
> 
> Can someone finally clearify why mkreiserfs _must_ advertise?
> 
> 
> I use mkreiserfs from namesys ftp. And I use it every month running a 
> script within a Konsole that I later search for errors. I know the 
> mkreiserfs message by mind now. And I cut the unneeded lines 
> (advertising ones) always while pasting the important lines of output to 
> the logs. This would be simplified by a small patch not violating 
> previous content nor function...
> 
> " ...Do You aggree with the Terms & Conditions before installation... 
> YES/No (Don't forget to type YES each time for sponsor A, B & C)."
> I don't want that kind of "progression" in any reiserfsprog!
> 
> 
> Happy holidays and some wunderful sunny days,
> 
> Manuel
> 

Addon: Shouldn't we moreover help on general performance or usability 
issues?!

e.g. fix the error-predicted  "-f" // "-ff" setting of recent mkreiserfs':


--------------080906060707070903030304
Content-Type: text/plain;
 name="rfs.mkreiserfs.out.3.6.6-pre1.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rfs.mkreiserfs.out.3.6.6-pre1.txt"

 # mkreiserfs

<-------------mkreiserfs, 2003------------->
reiserfsprogs 3.6.6-pre1

Usage: mkreiserfs [options]  device [block-count]

Options:

  -b | --block-size N              size of file-system block, in bytes
  -j | --journal-device FILE       path to separate device to hold journal
  -s | --journal-size N            size of the journal in blocks
  -o | --journal-offset N          offset of the journal from the start of
                                   the separate device, in blocks
  -t | --transaction-max-size N    maximal size of transaction, in blocks
  -h | --hash rupasov|tea|r5       hash function to use by default
  -u | --uuid UUID                 store UUID in the superblock
  -l | --label LABEL               store LABEL in the superblock
  --format 3.5|3.6                 old 3.5 format or newer 3.6
  -f | --force                     specified once, make mkreiserfs the whole
                                   disk, not block device or mounted partition;
                                   specified twice, do not ask for confirmation
  -d | --debug                     print debugging information during mkreiser
  -V                               print version and exit

--------------080906060707070903030304--
