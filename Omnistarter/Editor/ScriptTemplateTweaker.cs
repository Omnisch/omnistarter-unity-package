// author: Omnistudio
// version: 2025.03.15

using System;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Omnis.Editor
{
    public class ScriptTemplateTweaker : AssetModificationProcessor
    {
        public static void OnWillCreateAsset(string path)
        {
            path = path.Replace(".meta", "");

            if (path.EndsWith(".cs"))
            {
                EditorApplication.delayCall += () =>
                {
                    string fullPath = Application.dataPath[..^"Assets".Length] + path;

                    if (File.Exists(fullPath))
                    {
                        string content = File.ReadAllText(fullPath);

                        content = content
                            .Replace("#DATE#", DateTime.Now.ToString("yyyy.MM.dd"))
                            .Replace("#PARTIALSCRIPTNAME#", EditorTweaker.ExtractAssetMainNameFromPath(path));

                        File.WriteAllText(fullPath, content);
                        AssetDatabase.Refresh();
                    }
                };
            }
        }
    }
}
