package utils;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ScreenshotUtils {

    public static byte[] captureScreenshot(WebDriver driver, String scenarioName) {
        try {
            // Take screenshot as byte[]
            byte[] screenshotBytes = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);

            // Sanitize scenario name for Windows (remove illegal characters like " : * ? < > |)
            String safeScenarioName = scenarioName.replaceAll("[^a-zA-Z0-9-_\\. ]", "_");

            // Add timestamp
            String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());

            // Save screenshot file
            File screenshotFile = new File("screenshots/" + safeScenarioName + "_" + timestamp + ".png");

            // Create folder if it doesn’t exist
            screenshotFile.getParentFile().mkdirs();

            // Write file to disk
            Files.write(screenshotFile.toPath(), screenshotBytes);

            return screenshotBytes; // return for attaching to Cucumber report
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
