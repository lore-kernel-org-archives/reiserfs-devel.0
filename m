From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Re: Archiver
Date: Mon, 28 Apr 2003 13:22:56 +0200
Message-ID: <3EAD0F10.8050505@gbf.de>
References: <3EACFF00.6030507@gbf.de> <3EAD0062.7060603@namesys.com> <3EAD05FD.3080107@gbf.de> <161351974.20030428125026@tnonline.net> <3EAD0A80.2030605@gbf.de> <561202089.20030428131424@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <561202089.20030428131424@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com



Anders Widman schrieb am 04/28/2003 01:14 PM:

>  
>
>>Anders Widman schrieb am 04/28/2003 12:50 PM:
>>    
>>
>
>  
>
>>> 
>>>
>>>      
>>>
>>>>Hans Reiser schrieb am 04/28/2003 12:20 PM:
>>>>   
>>>>
>>>>        
>>>>
>>> 
>>>
>>>      
>>>
>>>>>Joachim Reichelt wrote:
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>Dear all,
>>>>>>
>>>>>>I know, it is a little bit out of topic, but we are looking for 
>>>>>>Software to archive our data held on
>>>>>>~400GB reiser fs.
>>>>>>We want to have exact one copy on tape of each file that is on our 
>>>>>>system at e.g. midnight.
>>>>>>Only new or changed files should go to tape.
>>>>>>Tapes are in an robot system of ~2TB.
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>lvm snapshots and dd or tar?
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>The data are on hardware raid, no lvm.
>>>>Tar: How to exclude all file the are on tape jet?
>>>>Where/How to find old files?
>>>>I think of features as seen in legatho, something like a HSM system
>>>>   
>>>>
>>>>        
>>>>
>>>  How  can  you without snapshots of the filesystem be able to backup
>>>  from one point in time? I mean if the filesystem changes during the
>>>  backup  you may loose (miss to backup) data that is changing/moving
>>>  or get partial files.
>>>
>>>      
>>>
>>The data to backup are produced during experiments. There is no need to 
>>get all files at a given time.
>>We only want to have all files on tape some days after creation.
>>    
>>
>
>  
>
>>>  Otherwise  it  should  not be such a big problem to use tar to copy
>>>  files  that  are  changed after a certain date (last backup). Check
>>>  the tar manpage :)
>>>
>>>      
>>>
>>I did this. But how to get file back? How to find them
>>    
>>
>
>
>  How  do you mean get the file back? The idea with backup is that you
>  have  them  in  case  you  loose files, corrupt or overwrite them by
>  accident?
>
The problem is: If i have the data written some time ago, find the tape 
the file is on.
We have a changer for 48 tapes and it takes some time to check all of them!
You know that usernever know exact data of there files.
So I have to setup mysql for it or somethink like that.

>  
>  
>
>>What about files copied over remote from WIN of created by progs that
>>reset a and m times?
>>    
>>
>
>  This  is  a  problem with Samba/Windows. You could make Samba to not
>  change  the  access/create  times,  or  control how it should update
>  them. It is a little tricky though, and might not help.
>
The files are mostly from WIN and we need the original timestamps, that 
is the problem.

>
>  //Anders
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>  
>

-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

WWW: http://www.gbf.de         _/_/_/   _/_/_/   _/_/_/_/
EMAIL: REICHELT@gbf.de       _/    _/  _/   _/  _/
                            _/        _/   _/  _/
Mascheroder Weg 1          _/  _/    _/_/_/   _/_/_/
D-38124 Braunschweig      _/    _/  _/   _/  _/
Tel: +(49) 531 6181 352  _/    _/  _/   _/  _/
FAX: +(49) 531 2612 388   _/_/_/  _/_/_/   _/

http://struktur.gbf.de/

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)


