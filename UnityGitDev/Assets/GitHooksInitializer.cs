using UnityEngine;
using UnityEditor;
using System.IO;

[InitializeOnLoad]
public class GitHooksInitializer
{
    static GitHooksInitializer()
    {
        Debug.LogWarning("Up and running ");
        Debug.LogWarning(Application.dataPath);

        foreach (var fileName in Directory.GetFiles(Application.dataPath))
        {
            Debug.LogWarning("file name = " + fileName);
        }

        var commitMsgHookFilePath = "D:/study/github/Unity_Study/UnityGitDev/Assets/commit-msg";

        var hooksDir = "D:/study/github/Unity_Study/.git/hooks";
        var destCommitMsgHookFilePath = "D:/study/github/Unity_Study/.git/hooks/commit-msg";
        var hookFileNames = Directory.GetFiles(hooksDir);
        foreach (var fileName in hookFileNames)
        {
            if (fileName.EndsWith("\\commit-msg.sample"))
            {
                Debug.LogWarning("file name = " + fileName);
            }
        }

        System.IO.File.Copy(commitMsgHookFilePath, destCommitMsgHookFilePath, true);

    }
}