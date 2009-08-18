From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 18 Aug 2009 07:32:59 GMT
Message-ID: <200908180732.n7I7WxN3031710@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536


Christian Kujau <lists@nerdbynature.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lists@nerdbynature.de




--- Comment #15 from Christian Kujau <lists@nerdbynature.de>  2009-08-18 07:32:56 ---
> Jun 14 11:20:07 scaleo smartd[4022]: Device: /dev/sda [SAT], SMART Usage
> Attribute: 194 Temperature_Celsius changed from 123 to 112

This should be the raw value of the SMART temperature attribute, not the real
value. Elmar, you should nevertheless check the temperature of your drives and
for hardware errors in general (cabling, bad memory, hot components, etc) to
rule out hardware issues. It may well be that the CPU is getting warmer than
usual when executing the script and the box just powers off for safety reasons.

 > find . -print0| while read -d $'\000' file; do
 >  echo $file >>/mnt/timestamped.ok
 >  touch -r "$file" -a "/mnt/ptgsuse-new/$file"
 > done

So, you basically create new files in /mnt/ptgsuse-new, with a refrence
timestamp of the file found in /mnt/ptgsuse? Or do the files in
/mnt/ptgsuse-new exist already and you're just changing atimes?

  > cd $MNT1
  > find . -xdev ! -type l -exec touch -r '{}' -a $MNT2/'{}' \; \
                           -exec echo '{}' >> $HOME/timestamped.ok \;

I've run this one a few times with already existing files in the other
filesystem (MNT2), no errors or powerdowns so far (vanilla, latest git).

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
