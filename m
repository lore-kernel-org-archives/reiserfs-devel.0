From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: struct dirent *ent->d_type weirdness
Date: Mon, 19 Sep 2005 18:33:48 +0400
Message-ID: <432ECC4C.30707@namesys.com>
References: <200509191558.27362.kris@koehntopp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509191558.27362.kris@koehntopp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?S3Jpc3RpYW4gS8O2aG50b3Bw?= <kris@koehntopp.de>
Cc: reiserfs-list@namesys.com

Hello

Kristian Köhntopp wrote:
> I have a machine running under 2.6.13-SMP, using reiserfs 3.6. On 
> this machine, directories are flagged strangely and thus code 
> which operates properly under ext3 fails with reiserfs.
> 
> Why is this, and what am I doing wrong?
> 
> My goal is to walk a spool directory recursively and deal with 
> all files inside directories that I encounter. For that, I check 
> struct dirent *ent->d_type and get unexpected results.
> 
Yes, unfortunately, reiserfs does not support entry types.
Probably it should, but there is nothing wrong to not support it:
man readdir:
       According to POSIX, the dirent structure contains a field char d_name[] of unspecified size, with at most NAME_MAX charac╜
       ters  preceding  the  terminating  null character.  Use of other fields will harm the portability of your programs.  POSIX
       1003.1-2001 also documents the field ino_t d_ino as an XSI extension.

> 
> mx15:/tmp # uname -a
> Linux mx15 2.6.13web #4 SMP Fri Sep 16 16:03:39 CEST 2005 i686 
> unknown
> 
> mx15:/tmp # cat rtest.cpp
> #include <stdio.h>
> #include <dirent.h>
> 
> int main(int argc, char** argv)
> {
> struct dirent *ent = NULL;
> DIR *dd = NULL;
> 
> dd = opendir(argv[1]);
> if (dd != NULL) {
>          while ((ent = readdir(dd)) != NULL) {
> 	 /* disable actual test and print ent->d_type */
> 	 /* ent->d_type==DT_DIR && ent->d_name[1]==0 && ent->d_name[0]>0 
> && ent->d_name[0]!='.'*/
> 		if (1) {
> 			printf("%s (%d) \n", ent->d_name, ent->d_type);
> 		}
>          }
>          closedir(dd);
> }
> }
> mx15:/tmp # ./rtest /netsite/var/spool/wmail.reiser
> . (0)
> .. (0)
> head (0)
> dbclub02 (0)
> mx15:/tmp # df -Th /netsite/var/spool/wmail.reiser
> Dateisystem   Typ    Größe Benut  Verf Ben% Eingehängt auf
> /reiserfile
>            reiserfs    2.0G   33M  2.0G 
> 2% /netsite/var/spool/wmail.reiser
> 
> 
> 
> Kristian
> 
> 

